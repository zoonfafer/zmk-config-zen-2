# Corne-ish Zen V2 Custom Configuration

![Corne-ish Zen Logo](img/Zen_R3_sticker.png)

[![.github/workflows/build.yml](https://github.com/zoonfafer/zmk-config-zen-2/actions/workflows/build.yml/badge.svg)](https://github.com/zoonfafer/zmk-config-zen-2/actions/workflows/build.yml)



(forked from https://github.com/a741725193/zmk-config-zen-2,
which in turn is forked from https://github.com/LOWPROKB/zmk-config-zen-2)

## Features

* Corne 3*6
  * The key matrix is the same as normal Corne.
* e-paper display
* RGB

## Resources

- The [official ZMK Firmware GitHub](https://github.com/zmkfirmware/zmk) repository. View the keymaps for other boards and shields as a starting point for your keymap.
- The [official ZMK Documentation](https://zmk.dev/docs) web site. Find the answers to many of your questions about ZMK Firmware.
- The [official ZMK Discord Server](https://zmk.dev/community/discord/invite). Instant conversations with other ZMK developers and users. Great technical resource!

## Development Instructions

1. Log into, or sign up for, your personal GitHub account.
2. Fork this repository to your local computer, and then push it to your GitHub personal account. ([instructions](https://docs.github.com/en/get-started/quickstart/fork-a-repo))
3. Edit the keymap file(s) to suit your needs:
    - Change [the keymap file](/config/corneish_zen.keymap) to edit keycodes, add new layers etc.
    - Change [the conf file](/config/corneish_zen.conf) to edit configuration settings like changing the deep sleep timeout
4. Commit and push your changes to your personal repo. Upon pushing it, GitHub Actions will start building a new version of your firmware with the updated keymap.
