# Home Assistant Add-on: Step CA

[step-ca](https://smallstep.com/docs/step-ca/) packaged as a Home Assistant
add-on for running a private certificate authority inside Home Assistant.

This add-on initializes a local CA, persists the CA state, exposes the step-ca
API on port `9000`, and exports the root CA certificate for clients that need to
trust certificates issued by it.

## Features

- Runs Smallstep step-ca inside Home Assistant
- Creates and persists CA data in `/config/step`
- Exposes the CA service on `9000/tcp`
- Exports the root CA certificate to `/ssl/root_ca.crt` by default
- Adds an ACME provisioner named `homeassistant`

## Documentation

For installation, configuration, and usage details, see [DOCS.md](./DOCS.md).

Add this repository to Home Assistant using:

```text
https://github.com/hobbypunk90/homeassistant-addon-step-ca
```

## Supported Architectures

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
