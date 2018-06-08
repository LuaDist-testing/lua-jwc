-- Copyright (c) 2016 Kim Alvefur
--
-- This project is MIT/X11 licensed. Please see the
-- COPYING file in the source package for more information.
--
-- Base64 URL en-/decoding

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

