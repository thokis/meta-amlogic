# Add GXL support - libretech-cc simply re-use reference design p241
KMACHINE_amlogic-p241 = "amlogic-p241"
KMACHINE_aml-s905x-cc = "amlogic-p241"
KMACHINE_aml-s805x-ac = "aml-s805x-ac"
COMPATIBLE_MACHINE_append_amlogic = "|amlogic-p241|aml-s905x-cc|aml-s805x-ac"

# Add AXG support
KMACHINE_amlogic-s400 = "amlogic-s400"
COMPATIBLE_MACHINE_append_amlogic = "|amlogic-s400"

# Add G12 support
KMACHINE_amlogic-u200 = "amlogic-u200"
COMPATIBLE_MACHINE_append_amlogic = "|amlogic-u200"
