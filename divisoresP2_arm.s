	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"divisoresP2.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d - Deficiente\012\000"
	.align	2
.LC1:
	.ascii	"%d - Perfecto\012\000"
	.align	2
.LC2:
	.ascii	"%d - Abundante\012\000"
	.text
	.align	2
	.global	comparaDivisores
	.syntax unified
	.arm
	.type	comparaDivisores, %function
comparaDivisores:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L2
	ldr	r1, [fp, #-8]
	ldr	r0, .L6
	bl	printf
	b	.L5
.L2:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bne	.L4
	ldr	r1, [fp, #-8]
	ldr	r0, .L6+4
	bl	printf
	b	.L5
.L4:
	ldr	r1, [fp, #-8]
	ldr	r0, .L6+8
	bl	printf
.L5:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	comparaDivisores, .-comparaDivisores
	.global	__aeabi_idivmod
	.align	2
	.global	divisoresArreglo
	.syntax unified
	.arm
	.type	divisoresArreglo, %function
divisoresArreglo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L9
.L13:
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L10
.L12:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	cmp	r3, #0
	bne	.L11
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L11:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	cmp	r3, r2
	ble	.L12
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	comparaDivisores
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L9:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L13
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	divisoresArreglo, .-divisoresArreglo
	.section	.rodata
	.align	2
.LC3:
	.ascii	"El arreglo es: \000"
	.align	2
.LC4:
	.ascii	"%d \000"
	.align	2
.LC5:
	.ascii	"\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #20
	mov	r3, sp
	mov	r8, r3
	mov	r0, #0
	bl	time
	mov	r2, r0
	mov	r3, r1
	mov	r3, r2
	mov	r0, r3
	bl	srand
	mov	r3, #15
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	sub	r3, r1, #1
	str	r3, [fp, #-40]
	mov	r2, r1
	mov	r3, #0
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r7, #5
	orr	r3, r3, r6, lsr #27
	lsl	r2, r6, #5
	mov	r2, r1
	mov	r3, #0
	mov	r4, r2
	mov	r5, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r5, #5
	orr	r3, r3, r4, lsr #27
	lsl	r2, r4, #5
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-44]
	ldr	r0, .L18
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L15
.L16:
	bl	rand
	mov	r1, r0
	ldr	r3, .L18+4
	smull	r2, r3, r1, r3
	asr	r2, r3, #5
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, r1, r3
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-32]
	str	r2, [r3, r1, lsl #2]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-32]
	ldr	r3, [r3, r2, lsl #2]
	mov	r1, r3
	ldr	r0, .L18+8
	bl	printf
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L15:
	ldr	r3, [fp, #-32]
	cmp	r3, #14
	ble	.L16
	ldr	r0, .L18+12
	bl	puts
	ldr	r1, [fp, #-36]
	ldr	r0, [fp, #-44]
	bl	divisoresArreglo
	mov	r3, #0
	mov	sp, r8
	mov	r0, r3
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LC3
	.word	1374389535
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.ident	"GCC: (15:13.2.rel1-2) 13.2.1 20231009"
