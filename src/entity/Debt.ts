import { Entity, PrimaryGeneratedColumn, Column } from "typeorm"

@Entity()
export class Debt {
    @PrimaryGeneratedColumn()
    id: number

    @Column({type: 'text', nullable: false})
    userId: string

    @Column({type: 'text', nullable: false})
    name: string

    @Column({type: 'decimal', nullable: false})
    originalBalance: number

    @Column({type: 'decimal', nullable: true})
    currentBalance: number

    @Column({type: 'decimal', nullable: true})
    apr: number

    @Column({type: 'int', nullable: true})
    originalTerm: number

    @Column({type: 'decimal', nullable: false})
    minimumPayment: number
}
