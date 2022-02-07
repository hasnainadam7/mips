.data
calcAngle:
        daddiu  $sp , $sp ,48
        sd      $fp,40($sp)
        move    $fp,$sp
        lui     $6,%hi(%neg(%gp_rel(calcAngle)))
        daddu   $6,$6,$25
        daddiu  $6,$6,%lo(%neg(%gp_rel(calcAngle)))
        move    $3,$4
        move    $2,$5
        sll     $3,$3,0
        sw      $3,16($fp)
        sll     $2,$2,0
        sw      $2,20($fp)
        lw      $3,16($fp)
        li      $2,12                 # 0xc
        bne     $3,$2,.L2
        nop

        sw      $0,16($fp)
.L2:
        lw      $3,20($fp)
        li      $2,60                 # 0x3c
        bne     $3,$2,.L3
        nop

        sw      $0,20($fp)
.L3:
        lw      $2,16($fp)
        sll     $2,$2,2
        sll     $3,$2,4
        subu    $3,$3,$2
        move    $2,$3
        lw      $3,20($fp)
        addu    $2,$3,$2
        mtc1    $2,$f0
        cvt.d.w $f1,$f0
        ld      $2,%got_page(.LC0)($6)
        ldc1    $f0,%got_ofst(.LC0)($2)
        mul.d   $f0,$f1,$f0
        trunc.w.d $f0,$f0
        mfc1    $2,$f0
        sw      $2,0($fp)
        lw      $2,20($fp)
        sll     $2,$2,1
        sll     $3,$2,2
        subu    $2,$3,$2
        sw      $2,4($fp)
        lw      $3,0($fp)
        lw      $2,4($fp)
        subu    $2,$3,$2
        bgez    $2,.L4
        nop

        subu    $2,$0,$2
.L4:
        sw      $2,8($fp)
        li      $3,360                  # 0x168
        lw      $2,8($fp)
        subu    $2,$3,$2
        sw      $2,12($fp)
        lw      $2,8($fp)
        lw      $4,12($fp)
        lw      $3,12($fp)
        slt     $4,$2,$4
        movz    $2,$3,$4
        move    $sp,$fp
        ld      $fp,40($sp)
        daddiu  $sp,$sp,48
        j       $31
        nop

.LC1:
        .ascii  "\012Angles move by hour hand: %d\000"
.LC2:
        .ascii  "\012Angles move by minute hand: %d\000"
.LC3:
        .ascii  "\012Wrong input..!\000"
.LC4:
        .ascii  "\012Angle between hour and minute hands %d\000"
main:
        daddiu  $sp,$sp,-48
        sd      $31,40($sp)
        sd      $fp,32($sp)
        sd      $28,24($sp)
        move    $fp,$sp
        lui     $28,%hi(%neg(%gp_rel(main)))
        daddu   $28,$28,$25
        daddiu  $28,$28,%lo(%neg(%gp_rel(main)))
        li      $2,11                 # 0xb
        sw      $2,0($fp)
        lw      $2,0($fp)
        move    $5,$2
        ld      $2,%got_page(.LC1)($28)
        daddiu  $4,$2,%got_ofst(.LC1)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        li      $2,30                 # 0x1e
        sw      $2,4($fp)
        lw      $2,4($fp)
        move    $5,$2
        ld      $2,%got_page(.LC2)($28)
        daddiu  $4,$2,%got_ofst(.LC2)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        lw      $2,0($fp)
        bltz    $2,.L7
        nop

        lw      $2,4($fp)
        bltz    $2,.L7
        nop

        lw      $2,0($fp)
        slt     $2,$2,13
        beq     $2,$0,.L7
        nop

        lw      $2,4($fp)
        slt     $2,$2,61
        bne     $2,$0,.L8
        nop

.L7:
        ld      $2,%got_page(.LC3)($28)
        daddiu  $4,$2,%got_ofst(.LC3)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        b       .L9
        nop

.L8:
        lw      $3,4($fp)
        lw      $2,0($fp)
        move    $5,$3
        move    $4,$2
        ld      $2,%got_disp(calcAngle)($28)
        move    $25,$2
        nop

        move    $5,$2
        ld      $2,%got_page(.LC4)($28)
        daddiu  $4,$2,%got_ofst(.LC4)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

.L9:
        move    $2,$0
        move    $sp,$fp
        ld      $31,40($sp)
        ld      $fp,32($sp)
        ld      $28,24($sp)
        daddiu  $sp,$sp,48
        j       $31
        nop

.LC0:
        .word   0
        .word   1071644672