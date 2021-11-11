# TODO: use machine feature to add USB, HDMI, ALSA, WiFi (...) support

# Add GXL support - libretech-cc simply re-use reference design p241
KMACHINE:amlogic-p241 = "amlogic-p241"
KMACHINE:aml-s905x-cc = "amlogic-p241"
KMACHINE:aml-s805x-ac = "aml-s805x-ac"
COMPATIBLE_MACHINE:append:amlogic = "|amlogic-p241|aml-s905x-cc|aml-s805x-ac"
