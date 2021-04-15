import { createConnection, Connection } from 'typeorm';

import * as entities from 'entities';

const createDatabaseConnection = (): Promise<Connection> => {
  console.log(process.env.DB_HOST.replace(/\n/g, ''));
  console.log(process.env.DB_PORT.replace(/\n/g, ''));
  console.log(process.env.DB_USERNAME.replace(/\n/g, ''));
  console.log(process.env.DB_PASSWORD.replace(/\n/g, ''));
  console.log(process.env.DB_DATABASE.replace(/\n/g, ''));
  return createConnection({
    type: 'postgres',
    host: process.env.DB_HOST.replace(/\n/g, ''),
    port: Number(process.env.DB_PORT.replace(/\n/g, '')),
    username: process.env.DB_USERNAME.replace(/\n/g, ''),
    password: process.env.DB_PASSWORD.replace(/\n/g, ''),
    database: process.env.DB_DATABASE.replace(/\n/g, ''),
    entities: Object.values(entities),
    synchronize: true,
  });
};

export default createDatabaseConnection;
