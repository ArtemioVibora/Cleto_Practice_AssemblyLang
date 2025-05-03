;CloudyCloud or CLOS bootloader

;16 bits Bootloader
bits  16

org     0x7c00 ;nibble, registry

start:  jmp loader ; jump over OEM block

; BIOS PARAMETER block

; TIMES 0B-$+start DB 0


;OEM or BIOS PARAMETER
bpbOEM:                 db "CloudOS  "

bpbBytesPerSector:      DW 512
bpbSectorsPerCluster:   DB 1
bpbReservedSectors:     DW 1
bpbNumberOfFATs:        DB 2
bpbRootEntries:         DW 224
bpbTotalSectors:        DW 2880
bpbMedia:               DB 0xF0
bpbSectorsPerFAT:       DW 9
bpbSectorsPerTrack:     DW 18
bpbHeadsPerCylinder:    DW 2 
bpbHiddenSectors:       DD 0 
bpbTotalSectorsBig:     DD 0 
bpbDriveNumber:         DD 0 
bsUnused:               DB 0 
bsExtBootSignature:     DB 0x29
bsSerialNumber:         DB 0xa0a1a2a3
bsVolumeLabel:          DB "CLOS Floppy  "
bsFileSystem:           DB "FAT12  "

msg db "Welcome to CLOS.... Join Develup", 0 

;Prints le db

Print:
        lodsb
        or        al, al
        jz        PrintDone
        mov       ah, 0eh
        int       10h 
        jmp       Print 

PrintDone:
        ret 


; BootLoader Entry Point

loader:

        xor       ax, ax
        mov       ds, ax
        mov       es, ax
        
        mov       si, msg
        call      Print
        
        xor       ax, ax
        int       0X12 

        cli
        hlt

;.Reset:
;        mov       ah, 0 
;        mov       dl, 0
;        int       0x13 
;        jc        .Reset
        
;        mov       ax, 0x1000
;        mov       es, ax
;        xor       bx, bx 
        
;        mov       ah, 0x02 
;        mov       al, 1 
;        mov       ch, 1 
;        mov       cl, 2 
;        mov       dh, 0 
;        mov       dl, 0 
;        int       0x13 

;        jmp       0x1000:0x0
        

times 510 - ($-$$) db 0

dw 0xAA55

