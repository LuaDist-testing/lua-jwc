local mime = require "mime";

local b64map = {
	['+'] = '-', ['/'] = '_', ['='] = '',
	['-'] = '+', ['_'] = '/'
};

local function encode(s)
	return (mime.b64(s):gsub("[+/=]", b64map));
end

local function decode(s)
	return (mime.unb64url(s:gsub("[-_]", b64map)).."==");
end

return {
	encode = encode;
	decode = decode;
}

