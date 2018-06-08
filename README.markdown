# JSON Web Crypto

This are some small libs for dealing with JOSE objects.

# Dependecies

-   Lua-CJSON
-   LuaSocket (the `mime` module)
-   LuaOpenSSL

# API

## JWS

`jws.sign(key, header, payload)`
:   Takes a `openssl.pkey`, a header and a payload (both tables) and
    returns a flattened JWS signature.

## JWK

`jwk.get_public(key)`
:   Takes an `openssl.pkey` and returns a public key in JWK format.

`jwk.thumbprint(key)`
:   Returns a Base64-URL encoded hash of the JWK public key in
    canonical order.


