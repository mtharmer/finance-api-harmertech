import Debt from '../models/Debt';
import { SessionRequest } from 'supertokens-node/framework/express';
import { userIdFromReq } from '../util/session';
import { Response } from 'express';

export async function getAllDebts(req: SessionRequest, res: Response) {
  try { 
    const debts = await Debt.find({userId: userIdFromReq(req)});
    res.json(debts);
  } catch (err) {
    console.error(err);
  }
};

export async function getOneDebt(req: SessionRequest, res: Response) {
  try {
    const debt = await Debt.findOne({_id: req.params.id})
    res.json(debt);
  } catch (err) {
    console.error(err);
    res.status(500);
  }
};

export async function createDebt(req: SessionRequest, res: Response) {
  try {
    const debt = await Debt.create({ userId: userIdFromReq(req), ...req.body});
    res.json(debt);
  } catch (err) {
    console.error(err);
    res.status(500);
  }
};

export async function updateDebt(req: SessionRequest, res: Response) {
  try {
    const userId = userIdFromReq(req);
    const debt = await Debt.updateOne({_id: req.params.id, userId: userId}, {userId: userId, ...req.body})
    res.json(debt)
  } catch (err) {
    console.error(err);
    res.status(500);
  }
};

export async function deleteDebt(req: SessionRequest, res: Response) {
  try {
    await Debt.deleteOne({ _id: req.params.id, userId: userIdFromReq(req) });
    res.status(200);
  } catch (err) {
    console.error(err);
    res.status(500);
  }
};
