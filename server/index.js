import express from 'express';
import { apolloServer } from 'apollo-server';
import schema from '../data/schema.graphql';
import Mocks from '../data/mocks';
import config from './config';

const { GRAPHQL_PORT } = config;
const server = express();

server.use(
  '/graphql',
  apolloServer({
    graphiql: true,
    pretty: true,
    schema: [schema],
    mocks: Mocks,
  }),
);
server.listen(GRAPHQL_PORT || 3000, () =>
  console.log(`GraphQL Server is now running on http://localhost:${GRAPHQL_PORT}/graphql`),
);
