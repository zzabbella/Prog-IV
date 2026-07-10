import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreatePessoaDto } from './dto/create-pessoa.dto';
import { UpdatePessoaDto } from './dto/update-pessoa.dto';
import { Pessoa } from './entities/pessoa.entity';

@Injectable()
export class PessoaService {
  constructor(
    @InjectRepository(Pessoa)
    private pessoaRepository: Repository<Pessoa>,
  ) {}

  async create(createPessoaDto: CreatePessoaDto, userId: number) {
    return this.pessoaRepository.save({
      ...createPessoaDto,
      userId,
    });
  }

  async findAll() {
    return this.pessoaRepository.find();
  }

  async findAllByUser(userId: number) {
    return this.pessoaRepository.find({ where: { userId } });
  }

  async findOne(id: number) {
    return this.pessoaRepository.findOne({ where: { id } });
  }

  async update(id: number, updatePessoaDto: UpdatePessoaDto) {
    await this.pessoaRepository.update(id, updatePessoaDto);
    return this.pessoaRepository.findOne({ where: { id } });
  }

  async remove(id: number) {
    return this.pessoaRepository.delete(id);
  }
}