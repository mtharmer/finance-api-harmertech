import supertest from "supertest";
import app from '../app';
import Debt from "../models/debt.model";

const request = supertest(app);

const userId = 'someuser';

jest.mock('../middleware/validateSession', () => ({
    __esModule: true,
    default: () => jest.fn((_req, _res, next) => next())
}))

jest.mock('../util/session', () => ({
  __esModule: true,
  userIdFromReq: () => userId
}))

beforeEach(() => {
  jest.clearAllMocks();
});

describe('Debts Controller', () => {
  // it('GET /debts should return 401 when unauthorized', async () => {
  //   const response = await request.get('/debts');
  //   expect(response.status).toBe(401);
  // });
  describe('GET /debts', () => {
    it('GET /debts should return an array when authorized', async () => {
      const response = await request.get('/debts');
      expect(response.status).toBe(200);
    });
  });

  describe ('GET /debts/:id', () => {
    it('should return 404 if the debt is not found', async () => {
      const response = await request.get('/debts/6849a2264b3e5f7c12de0f2b');
      expect(response.status).toBe(404);
      expect(response.body).toEqual({"error": "Debt could not be found"})
    });

    it('should return 200 with the debt if found', async () => {
      const debt = await Debt.create({userId: userId, name: 'some debt', originalBalance: 500, minimumPayment: 50});
      const response = await request.get(`/debts/${debt._id}`);
      expect(response.status).toBe(200);
      expect(`${response.body._id}`).toEqual(`${debt._id}`)
    });
  });

  describe('POST /debt/', () => {

  });

  describe('PUT /debts/update/:id', () => {
    it('should error if the debt is not found', async () => {
      const response = await request.put('/debts/update/6849a2264b3e5f7c12de0f2b')
      expect(response.status).toBe(404)
    });
  });
});
