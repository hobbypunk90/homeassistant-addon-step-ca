# Home Assistant Add-on: Step CA

## About

This add-on runs [Smallstep step-ca](https://smallstep.com/docs/step-ca/) as a
private certificate authority inside Home Assistant.

On first start, the add-on initializes a new CA, stores its persistent data in
`/config/step`, starts the step-ca service on port `9000`, and exports the root
certificate to the configured `root_ca_path`.

## Before You Start

Before starting this add-on:

- Choose a strong password to protect the CA material.
- Ensure TCP port `9000` is available on your Home Assistant host.
- Decide where the exported root certificate should be written. The default path
  is `/ssl/root_ca.crt`.
- Plan how client devices or services will trust the generated root certificate.

## Installation

1. Install the add-on.
2. Open the add-on configuration.
3. Set a strong `password`.
4. Optionally enable `debug`.
5. Optionally change `root_ca_path`.
6. Start the add-on.
7. Check the add-on logs after startup.

## Configuration

Example add-on configuration:

```yaml
password: "replace-with-a-strong-password"
debug: false
root_ca_path: /ssl/root_ca.crt
```

### Option: `password`

Password used by step-ca to protect the CA keys and configuration.

### Option: `debug`

Enables step debug logging.

### Option: `root_ca_path`

Filesystem path where the add-on copies the generated root CA certificate.

## Network

This add-on exposes the following port:

- `9000/tcp`: step-ca API endpoint

## Persistent Data

The add-on stores or writes data in the following locations:

- `/config/step`: Persistent step-ca configuration, keys, and certificates
- `/ssl/root_ca.crt`: Default exported root certificate path

## First Start

On the first successful start, the add-on initializes a new CA and writes useful
bootstrap information to the logs, including:

- The root certificate fingerprint
- A generated root token
- The root certificate
- The intermediate certificate

Review the logs to confirm initialization completed successfully and to record
the fingerprint if you need it for client verification.

## Important Notes

- This add-on provides a private CA service. It does not automatically configure
  Home Assistant or other clients to use issued certificates.
- If you want to connect this CA to Home Assistant as a client, see
  [hassio-step-ca-client](https://github.com/miguelangel-nubla/hassio-step-ca-client).
- Any client that should trust certificates issued by this CA must trust the
  exported root certificate.
- If you delete `/config/step`, the CA will be recreated on the next start and
  previously trusted certificates will no longer chain to the new root.
