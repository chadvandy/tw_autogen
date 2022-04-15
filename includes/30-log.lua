local details = {
    _DESCRIPTION = '30 lines library for object orientation in Lua',
    _VERSION     = '30log v1.3.0',
    _URL         = 'http://github.com/Yonaba/30log',
    _LICENSE     = 'MIT LICENSE <http://www.opensource.org/licenses/mit-license.php>',
}

local next         = next
local assert       = assert
local pairs        = pairs
local type         = type
local tostring     = tostring
local setmetatable = setmetatable

local _class
local baseMt     = {}
local _instances = setmetatable({},{__mode = 'k'})
local _classes   = setmetatable({},{__mode = 'k'})

isClass   = function(t) return not not _classes[t] end
isInstance = function(t) return not not _instances[t] end

--- TODO redo this entire file so it's a bit more readable and usable; default_class should be the documented base class type.
local default_class = {}

local function assert_call_from_class(class, method)
	assert(_classes[class], ('Wrong method call. Expected class:%s.'):format(method))
end

local function assert_call_from_instance(instance, method)
	assert(_instances[instance], ('Wrong method call. Expected instance:%s.'):format(method))
end

local function bind(f, v) 
	return function(...) return f(v, ...) end 
end

local default_filter = function() return true end
	
local function deep_copy(t, dest, aType)
	t = t or {}
	local r = dest or {}
	for k,v in pairs(t) do
		if aType ~= nil and type(v) == aType then
			r[k] = (type(v) == 'table')
							and ((_classes[v] or _instances[v]) and v or deep_copy(v))
							or v
		elseif aType == nil then
			r[k] = (type(v) == 'table') 
			        and k~= '__index' and ((_classes[v] or _instances[v]) and v or deep_copy(v)) 
							or v
		end
	end
	return r
end

--- Create a new subclass from an existing class.
---@param super Class
---@param className string
---@param extra_params table
---@return Class
local function extend(super, className, extra_params)
	assert_call_from_class(super, 'extend(...)')

	---@type Class
	local heir = {}
	_classes[heir] = tostring(heir)
	super.__subclasses[heir] = true
	deep_copy(extra_params, deep_copy(super, heir))
	heir.className    = extra_params and extra_params.className or className
	heir.__index = heir

	---@type Class
	heir.super   = super
	heir.mixins = {}
	return setmetatable(heir,super)
end

baseMt = {
	__call = function (self,...) return self:new(...) end,
	
	__tostring = function(self,...)
		if _instances[self] then
			return ("instance of '%s' (%s)"):format(rawget(self.class,'className') 
								or '?', _instances[self])
		end
		return _classes[self] 
							and ("class '%s' (%s)"):format(rawget(self,'className')
							or '?',
					_classes[self]) or self
	end
}

_classes[baseMt] = tostring(baseMt)
setmetatable(baseMt, {__tostring = baseMt.__tostring})

local function new_obj(self, ...)
	assert_call_from_class(self, 'new(...) or class(...)')

	---@type Class
	local instance = {class = self}
	_instances[instance] = tostring(instance)
	deep_copy(self, instance, 'table')
	instance.__index = nil
	instance.mixins = nil
	instance.__subclasses = nil
	instance.__instances = nil
	setmetatable(instance,self)

	return instance
end

---@return Class
_class = function(className, attr)
    ---@class Class
	local c = deep_copy(attr)
	_classes[c] = tostring(c)
	c.className = className or c.className
	c.__tostring = baseMt.__tostring
	c.__call = baseMt.__call

	---@param self Class
	---@return Class
	c.__new = function(self)
		local o = new_obj(self)
		return o
	end

	c.extend = extend
	c.__index = c
	
	c.mixins = setmetatable({},{__mode = 'k'})
	c.__instances = setmetatable({},{__mode = 'k'})
	c.__subclasses = setmetatable({},{__mode = 'k'})
	
	c.subclasses = function(self, filter, ...)
		assert_call_from_class(self, 'subclasses(class)')
		filter = filter or default_filter
		local subclasses = {}
		for class in pairs(_classes) do
			if class ~= baseMt and class:subclassOf(self) and filter(class,...) then 
				subclasses[#subclasses + 1] = class 
			end
		end
		return subclasses
	end
	
	c.instances = function(self, filter, ...)
		assert_call_from_class(self, 'instances(class)')	
		filter = filter or default_filter		
		local instances = {}
		for instance in pairs(_instances) do
			if instance:instanceOf(self) and filter(instance, ...) then 
				instances[#instances + 1] = instance
			end
		end
		return instances
	end

	c.subclassOf = function(self, superclass)
		assert_call_from_class(self, 'subclassOf(superclass)')
		assert(isClass(superclass), 'Wrong argument given to method "subclassOf()". Expected a class.')
		local super = self.super
		while super do
			if super == superclass then return true end
			super = super.super
		end
		return false
	end
	
	c.classOf = function(self, subclass)
		assert_call_from_class(self, 'classOf(subclass)')
		assert(isClass(subclass), 'Wrong argument given to method "classOf()". Expected a class.')		
		return subclass:subclassOf(self)
	end	

	c.instanceOf = function(self, fromclass)
		assert_call_from_instance(self, 'instanceOf(class)')
		assert(isClass(fromclass), 'Wrong argument given to method "instanceOf()". Expected a class.')
		return ((self.class == fromclass) or (self.class:subclassOf(fromclass)))
	end
	
	c.cast = function(self, toclass)
		assert_call_from_instance(self, 'instanceOf(class)')
		assert(isClass(toclass), 'Wrong argument given to method "cast()". Expected a class.')
		setmetatable(self, toclass)
		self.class = toclass
		return self
	end
	
	c.with = function(self,...)
		assert_call_from_class(self, 'with(mixin)')
		for _, mixin in ipairs({...}) do
			assert(self.mixins[mixin] ~= true, ('Attempted to include a mixin which was already included in %s'):format(tostring(self)))
			self.mixins[mixin] = true
			deep_copy(mixin, self, 'function')
		end
		return self
	end
	
	c.includes = function(self, mixin)
		assert_call_from_class(self,'includes(mixin)')
		return not not (self.mixins[mixin] or (self.super and self.super:includes(mixin)))
	end	
	
	c.without = function(self, ...)
		assert_call_from_class(self, 'without(mixin)')
		for _, mixin in ipairs({...}) do
			assert(self.mixins[mixin] == true, ('Attempted to remove a mixin which is not included in %s'):format(tostring(self)))		
			local classes = self:subclasses()
			classes[#classes + 1] = self
			for _, class in ipairs(classes) do
				for method_name, method in pairs(mixin) do
					if type(method) == 'function' then 
						class[method_name] = nil 
					end
				end
			end
			self.mixins[mixin] = nil
		end
		return self
	end
	return setmetatable(c, baseMt)
end


return
    --- Create a new class object!
    ---@param className string The new class's name.
    ---@param attr table Default attributes for this class.
    ---@return Class
    function(className, attr, parent) return _class(className, attr) end