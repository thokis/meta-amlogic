# Add GXL support - libretech-cc simply re-use reference design p241
KMACHINE:amlogic-p241 = "amlogic-p241"
KMACHINE:aml-s905x-cc = "amlogic-p241"
KMACHINE:aml-s805x-ac = "aml-s805x-ac"
COMPATIBLE_MACHINE:append:amlogic = "|amlogic-p241|aml-s905x-cc|aml-s805x-ac"

# Add AXG support
KMACHINE:amlogic-s400 = "amlogic-s400"
COMPATIBLE_MACHINE:append:amlogic = "|amlogic-s400"

# Add G12 support
KMACHINE:amlogic-u200 = "amlogic-u200"
KMACHINE:aml-a311d-cc = "libretech-cottonwood"
KMACHINE:khadas-vim3 = "khadas-vim3"
COMPATIBLE_MACHINE:append:amlogic = "|amlogic-u200|khadas-vim3"

# Add SM1 support
KMACHINE:aml-s905d3-cc = "libretech-cottonwood"
KMACHINE:khadas-vim3l = "khadas-vim3"
COMPATIBLE_MACHINE:append:amlogic = "|khadas-vim3l"
