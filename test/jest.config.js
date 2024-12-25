module.exports = {
    preset: 'ts-jest',
    testEnvironment: 'node',
    testMatch: ['**/*.test.ts'],
    collectCoverage: true,
    collectCoverageFrom: [
        '<rootDir>/core/**/*.ts', 
        '!<rootDir>/core/**/index.ts' 
    ]
}
