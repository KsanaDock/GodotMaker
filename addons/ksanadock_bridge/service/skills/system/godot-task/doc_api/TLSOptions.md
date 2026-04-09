## TLSOptions <- RefCounted

**Methods:**
- client(trusted_chain: X509Certificate = null, common_name_override: String = "") -> TLSOptions
- client_unsafe(trusted_chain: X509Certificate = null) -> TLSOptions
- get_common_name_override() -> String
- get_own_certificate() -> X509Certificate
- get_private_key() -> CryptoKey
- get_trusted_ca_chain() -> X509Certificate
- is_server() -> bool
- is_unsafe_client() -> bool
- server(key: CryptoKey, certificate: X509Certificate) -> TLSOptions
