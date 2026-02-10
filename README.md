# Homebrew Tap for Roxy

![Roxy](assets/roxy-on-cask-small.png)

**Local development proxy with custom `.roxy` domains and automatic HTTPS.**
One binary. Zero config files. Zero dependencies.

[Main Repository](https://github.com/rbas/roxy) |
[Report Issue](https://github.com/rbas/roxy/issues) |
[Releases](https://github.com/rbas/roxy/releases)

---

## Install

```bash
brew tap rbas/roxy
brew install roxy
```

## Update

```bash
brew update
brew upgrade roxy
```

## What is Roxy?

Roxy is a local development proxy that gives you real `.roxy`
domains with trusted HTTPS for every project on your machine.
No nginx, no dnsmasq, no Docker, no config files -- just
register a domain and go.

```bash
# One-time setup
sudo roxy install

# Register your project
sudo roxy register myapp.roxy --route "/=3000"

# Start the proxy
sudo roxy start

# Open https://myapp.roxy in your browser -- trusted HTTPS, no warnings
```

For full documentation, usage examples, and features,
visit the
**[main Roxy repository](https://github.com/rbas/roxy)**.

## Important Notes After Installation

During `sudo roxy install`, Roxy creates a Root Certificate
Authority and adds it to your system keychain.
**You will be prompted for your password or fingerprint**
to authorize adding the certificate to the trust store.

After the first install, **restart your browser** for the
certificates to be recognized. If you skip this step, you will
see certificate warnings when accessing `.roxy` domains.

For detailed setup instructions, troubleshooting, and
configuration options, see the
[full documentation](https://github.com/rbas/roxy/blob/main/docs/README.md).

## Available Formulae

| Formula | Description                                     |
| ------- | ----------------------------------------------- |
| `roxy`  | Local dev proxy with `.roxy` domains and HTTPS  |

## Requirements

- **macOS** (Monterey or later)
- **sudo** access (needed for ports 80/443 and DNS configuration)

## Auto-Start on Boot

You can use `brew services` to start Roxy automatically:

```bash
# Start roxy now and auto-start at boot
sudo brew services start roxy
```

To stop auto-start:

```bash
sudo brew services stop roxy
```

## Troubleshooting

**Browser shows certificate warnings:**

Restart your browser after running `sudo roxy install`.
The browser needs to reload the system trust store to
recognize Roxy's Root CA.

**Formula not found after tapping:**

```bash
brew untap rbas/roxy
brew tap rbas/roxy
brew install roxy
```

**Stale version after upgrade:**

```bash
brew update
brew reinstall roxy
```

For more troubleshooting help, check the
[main documentation][troubleshooting].

[troubleshooting]: https://github.com/rbas/roxy/blob/main/docs/README.md#troubleshooting

## License

[MIT](https://github.com/rbas/roxy/blob/main/LICENSE.md) -- Martin Voldrich
