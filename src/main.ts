import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  try {
    const app = await NestFactory.create(AppModule);

    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
        forbidNonWhitelisted: true,
        transform: true,
        transformOptions: {
          enableImplicitConversion: true,
        },
      }),
    );

    app.enableCors({
      origin: '*',
      methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
      credentials: true,
    });

    const port = process.env.PORT ? Number(process.env.PORT) : 3000;

    await app.listen(port);

    console.log('✅ Aplicação NestJS iniciada com sucesso!');
    console.log(`🚀 Servidor rodando em: http://localhost:${port}`);
    console.log('📦 TypeORM + SQLite configurados corretamente.');
    console.log('🛡️  Validação global e CORS habilitados.');
  } catch (error) {
    console.error('❌ Erro ao iniciar a aplicação:', error);
    process.exit(1);
  }
}

void bootstrap();