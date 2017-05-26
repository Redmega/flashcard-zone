import express from 'express';
import bodyParser from 'body-parser';

import { graphqlExpress, graphiqlExpress } from 'graphql-server-express';
import { makeExecutableSchema, addMockFunctionsToSchema } from 'graphql-tools';

import Schema from '../data/schema.graphql';
import Mocks from '../data/mocks';

import config from './config';

const { GRAPHQL_PORT } = config;
const server = express();

const executableSchema = makeExecutableSchema({
  typeDefs: Schema,
  // resolvers: Resolvers,
  // connectors: Connectors,
});

addMockFunctionsToSchema({
  schema: executableSchema,
  mocks: Mocks,
  preserveResolvers: true,
});

server.use(
  '/graphql',
  bodyParser.json(),
  graphqlExpress({
    schema: executableSchema,
    context: {}, //at least(!) an empty object
    pretty: true,
  }),
);

server.use(
  '/graphiql',
  graphiqlExpress({
    endpointURL: '/graphql',
  }),
);

server.listen(GRAPHQL_PORT || 3000, () =>
  console.log(`GraphQL Server is now running on http://localhost:${GRAPHQL_PORT}/graphql`),
);
