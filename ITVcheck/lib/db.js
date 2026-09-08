import { createClient } from '@libsql/client';

export const db = createClient({
  url: process.env.D1_DATABASE_URL,
  authToken: process.env.D1_AUTH_TOKEN,
});