import express from 'express';
import { verifySession } from "supertokens-node/recipe/session/framework/express";
import Debt from '../models/Debt';
import { SessionRequest } from 'supertokens-node/framework/express';

const router = express.Router();

router.get('/', verifySession(), async (req: SessionRequest, res) => {
  try { 
    const userId = req.session!.getUserId();
    const debts = await Debt.find({userId: userId});
    console.log(debts);
    res.json(debts);
  } catch (err) {
    console.error(err);
  }
});

router.post('/debt', verifySession(), async (req, res) => {
  console.log("Request: ", req)

  try {
    await Debt.save();
    res.send("YAY");
  } catch (err) {
    console.error(err);
    res.status(500);
  }
});

export default router;
