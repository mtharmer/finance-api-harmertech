module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  testMatch: ['**/src/tests/**/*.test.ts'],
  verbose: true,
  forceExit: true,
  clearMocks: true,
  setupFilesAfterEnv: ["./src/tests/testSetup.ts"],
};
