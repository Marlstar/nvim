return function (var, val)
	io.write(string.format("\027]1337;SetUserVar=%s=%s\a", var, require("util.base64")(val)))
end
