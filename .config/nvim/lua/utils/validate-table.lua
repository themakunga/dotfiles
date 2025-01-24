local M = {}

M.validate = function(schema, data)
    if type(schema) ~= "table" or type(data) ~= "table" then
        return false, "Both schemas and data should be tables."
    end

    for key, expectedType in pairs(schema) do
        local value = data[key]
        local isOptional = (string.sub(expectedType, -1) == "?") or
        (type(expectedType) == "table" and expectedType.optional == true)
        local baseType = isOptional and string.sub(expectedType, 1, -2) or expectedType

        if value == nil then
            if not isOptional then
                return false, string.format("Key '%s' is required but is missing.", key)
            end
        else
            if type(baseType) == "string" then
                if type(value) ~= baseType then
                    return false,
                        string.format("Key '%s' expected type is '%s' but got '%s'", key, baseType, type(value))
                end
            elseif type(baseType) == "table" then
                if type(value) ~= "table" then
                    return false, string.format("Key '%s' expected a table but got '%s'.", key, type(value))
                end
                local isValid, err = M.validate(baseType, value)
                if not isValid then
                    return false, string.format("Key '%s': '%s", key, err)
                end
            else
                return false, string.format("Invalid schema definition for key '%s'.", key)
            end
        end
    end
    return true
end


return M
