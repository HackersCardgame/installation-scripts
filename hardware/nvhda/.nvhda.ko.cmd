cmd_/home/marc/installation-scripts/hardware/nvhda/nvhda.ko := ld -r -m elf_x86_64 -z max-page-size=0x200000 -T ./scripts/module-common.lds --build-id  -o /home/marc/installation-scripts/hardware/nvhda/nvhda.ko /home/marc/installation-scripts/hardware/nvhda/nvhda.o /home/marc/installation-scripts/hardware/nvhda/nvhda.mod.o ;  true
