import Debt from '../models/debt.model';
import { SessionRequest } from 'supertokens-node/framework/express';
import { userIdFromReq } from '../util/session';
import { Response } from 'express';

export async function getAllDebts(req: SessionRequest, res: Response) {
  try { 
    const debts = await Debt.find({userId: userIdFromReq(req)});
    res.status(200).json(debts);
  } catch (err) {
    console.error(err);
    res.status(500);
  }
};

export async function getOneDebt(req: SessionRequest, res: Response) {
  try {
    const debt = await Debt.findById(req.params.id)
    if (!debt) {
      return res.status(404).json({error: 'Debt could not be found'});
    }
    return res.status(200).json(debt);
  } catch (err) {
    console.error(err);
    return res.status(500).json({error: err});
  }
};

export async function createDebt(req: SessionRequest, res: Response) {
  try {
    const debt = await Debt.create({ userId: userIdFromReq(req), ...req.body});
    res.status(200).json(debt);
  } catch (err) {
    console.error(err);
    res.status(500);
  }
};

export async function updateDebt(req: SessionRequest, res: Response) {
  try {
    const userId = userIdFromReq(req);
    const debt = await Debt.updateOne({_id: req.params.id, userId: userId}, {userId: userId, ...req.body})
    if (!debt.acknowledged || debt.matchedCount <= 0) {
      return res.status(404).json({error: 'Debt could not be found'})
    }
    return res.status(200).json(debt)
  } catch (err) {
    console.error(err);
    return res.status(500);
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
