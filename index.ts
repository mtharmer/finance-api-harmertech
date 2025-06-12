import app from './app';
import logger from 'logger';

const port = process.env.API_PORT || 3001

app.listen(port, () => logger.info(`API Server listening on port ${port}`));
