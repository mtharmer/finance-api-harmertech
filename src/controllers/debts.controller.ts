import { Debt } from '../entity/Debt';
import { SessionRequest } from 'supertokens-node/framework/express';
import { userIdFromReq } from '../util/session';
import { Response } from 'express';
import logger from '../logger';
import { db } from '../app.config';

export async function getAllDebts(req: SessionRequest, res: Response) {
  logger.http('received GET /debts/');
  try { 
    const debts = await db.manager.find(Debt, {where: {userId: userIdFromReq(req)}});
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
    const debt = await db.manager.findOneBy(Debt, {id: Number(req.params.id)})
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
    const debt = db.manager.create(Debt, { userId: userIdFromReq(req), ...req.body });
    const results = await db.manager.save(Debt, debt)
    logger.http('responding to POST /debts/new with status 200');
    return res.status(200).json(results);
  } catch (err) {
    logger.error('createDebt returned error', {error: err});
    logger.http('responding to POST /debts/new with status 500');
    return res.status(500).json({error: err});
  }
};

export async function updateDebt(req: SessionRequest, res: Response) {
  logger.http('received PUT /debts/update');
  logger.info("params", req.params);
  try {
    const userId = userIdFromReq(req);
    const debt = await db.manager.findOneBy(Debt, {id: Number(req.params.id), userId: userId});
    if (!debt) {
      logger.http('responding to PUT /debts/update with status 404');
      return res.status(404).json({error: 'Debt was not found'});
    }
    db.manager.merge(Debt, debt, req.body);
    const results = await db.manager.save(Debt, debt);
    logger.http('responding to PUT /debts/update with status 200');
    return res.status(200).json(results)
  } catch (err) {
    logger.error('updateDebt returned error', {error: err});
    logger.http('responding to PUT /debts/update with status 500');
    return res.status(500).json({error: err});
  }
};

export async function deleteDebt(req: SessionRequest, res: Response) {
  logger.http('received DELETE /debts/delete');
  try {
    const results = await db.manager.delete(Debt, { id: Number(req.params.id), userId: userIdFromReq(req) });
    logger.http('responding to DELETE /debts/delete with status 200');
    res.status(200).json(results);
  } catch (err) {
    logger.error('deleteDebt returned error', {error: err});
    logger.http('responding to DELETE /debts/delete with status 500');
    res.status(500).json({error: err});
  }
};
