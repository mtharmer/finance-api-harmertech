import * as winston from "winston";

const formatter = winston.format.printf(({ level, message, service, timestamp, ...splat }) => {
  let log = `[${timestamp}] <${service}> ${level.toUpperCase()}: ${message}`;
  if (Object.keys(splat).length > 0) {
    log += ` ${JSON.stringify(splat)}`
  }
  return log;
});

const logger = winston.createLogger({
  level: process.env.LOG_LEVEL || 'info',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.simple(),
    formatter
  ),
  defaultMeta: { service: 'finance-api-service' },
  transports: [
    new winston.transports.Console()
  ],
});

export default logger;
