	.data
 
; valore iniziale del numero di nepero
valore: .float 2.0 

; vettore contenente i valori di n!					
fattoriale: .float 2, 6, 24, 120, 720, 5040, 40320     

; dividendo per le divisioni
dividendo: .float 1.0	

; contatore di ciclo				
i: .word 7						
	
	.text
	.global main

main:   ; funzione main

        LW R2, i	 ; caricamento di i in R2
	LF F2, valore    ; caricamento del numero di nepero in F2
	LF F8, dividendo ; caricamento del dividendo in F8
Loop:
	; funzione Loop
	LF F6, fattoriale(R1) ; caricamento del valore di n! in F6
	DIVF F10, F8, F6      ; divisione FP 1/n!, risultato salvato in F10
	ADDF F2, F2, F10      ; addizione FP nepero = nepero + 1/n!, risultato salvato in F2
	SUBI R2, R2, #1	      ; viene decrementato i di 1
        ADDI R1, R1, #0x4     ; viene fatto puntare r1 all'indirizzo del fattoriale successivo
        BNEZ R2, Loop	      ; reinizia il ciclo se il contenuto di R2 è != 0
	trap 0		      ; istruzione di fine esecuzione
