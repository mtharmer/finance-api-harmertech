import Debt from '../models/debt.model';
import { SessionRequest } from 'supertokens-node/framework/express';
import { userIdFromReq } from '../util/session';
import { Response } from 'express';
import logger from '../logger';

export async function getAllDebts(req: SessionRequest, res: Response) {
  logger.http('received GET /debts/');
  try { 
    const debts = await Debt.find({userId: userIdFromReq(req)});
    logger.http('responding to GET /debts/ with status 200');
    res.status(200).json(debts);
  } catch (err) {
    logger.error('getAllDebts returned error', {error: err});
    logger.http('responding to GET /debts/ with status 500');
    res.status(500).json({error: err});
  }
};

export async function getOneDebt(req: SessionRequest, res: Response) {
  logger.http('received GET /debts/:id');
  try {
    const debt = await Debt.findById(req.params.id)
    if (!debt) {
      logger.http('responding to GET /debts/:id with status 404');
      return res.status(404).json({error: 'Debt could not be found'});
    }
    logger.http('responding to GET /debts/:id with status 200');
    return res.status(200).json(debt);
  } catch (err) {
    logger.error('getOneDebt returned error', {error: err});
    logger.http('responding to GET /debts/:id with status 500');
    return res.status(500).json({error: err});
  }
};

export async function createDebt(req: SessionRequest, res: Response) {
  logger.http('received POST /debts/new');
  try {
    const debt = await Debt.create({ userId: userIdFromReq(req), ...req.body });
    logger.http('responding to POST /debts/new with status 200');
    res.status(200).json(debt);
  } catch (err) {
    logger.error('createDebt returned error', {error: err});
    logger.http('responding to POST /debts/new with status 500');
    res.status(500).json({error: err});
  }
};

export async function updateDebt(req: SessionRequest, res: Response) {
  logger.http('received PUT /debts/update');
  try {
    const userId = userIdFromReq(req);
    const result = await Debt.updateOne({_id: req.params.id, userId: userId}, {userId: userId, ...req.body}, {runValidators: true})
    if (!result.acknowledged) {
      logger.http('responding to PUT /debts/update with status 500');
      return res.status(500).json({error: 'Something went wrong'});
    } else if (result.matchedCount <= 0) {
      logger.http('responding to PUT /debts/update with status 404');
      return res.status(404).json({error: 'Debt could not be found'})
    }
    logger.http('responding to PUT /debts/update with status 200');
    return res.status(200).json({message: 'success'})
  } catch (err) {
    logger.error('updateDebt returned error', {error: err});
    logger.http('responding to PUT /debts/update with status 500');
    return res.status(500).json({error: err});
  }
};

export async function deleteDebt(req: SessionRequest, res: Response) {
  logger.http('received DELETE /debts/delete');
  try {
    const result = await Debt.deleteOne({ _id: req.params.id, userId: userIdFromReq(req) });
    if (!result.acknowledged) {
      logger.http('responding to DELETE /debts/delete with status 500');
      return res.status(500).json({error: 'Something went wrong'});
    } else if (result.deletedCount <= 0) {
      logger.http('responding to DELETE /debts/delete with status 404');
      return res.status(404).json({error: 'Debt could not be found'})
    }
    logger.http('responding to DELETE /debts/delete with status 200');
    return res.status(200).json({message: 'success'});
  } catch (err) {
    logger.error('deleteDebt returned error', {error: err});
    logger.http('responding to DELETE /debts/delete with status 500');
    return res.status(500).json({error: err});
  }
};
