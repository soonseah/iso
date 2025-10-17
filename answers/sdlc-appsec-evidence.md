# Tech 10 — SDLC and Application Security: Evidence

Summary
- Transport security: TLS 1.2/1.3 enforced at the edge and application tier. HSTS enabled where supported; weak ciphers disabled.
- Application security: Passwords hashed server‑side with a strong algorithm (see screenshot). Secrets roadmap tracked separately (Key Vault/OIDC gap noted in `answers/gaps-and-actions.md`).

Evidence — Screenshot paths
- TLS configuration (edge/App GW/Front Door or reverse proxy): `answers/evidence/appsec/tls-config-1-2025-10-17.png`
- TLS configuration (Tomcat/server.xml or service TLS policy): `answers/evidence/appsec/tls-config-2-2025-10-17.png`
- Application crypto evidence (e.g., encryption/hashing utility in code): `answers/evidence/appsec/encryption-code-2025-10-17.png`

Click path to reproduce onsite
- Edge: Azure Front Door/App Gateway → TLS/SSL policy → show minimum TLS version and cipher policy (modern).
- App: Tomcat `conf/server.xml` → connector shows `sslEnabledProtocols="TLSv1.2,TLSv1.3"` and modern ciphers.
- Code: Open the security/auth module showing hashing implementation and parameters (cost/iterations, per‑user salt).

Notes
- Keep filenames dated (YYYY‑MM‑DD). Replace with newer screenshots as you capture them.
