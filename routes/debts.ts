import express from 'express';
import { verifySession } from "supertokens-node/recipe/session/framework/express";
import * as ctrl from '../controllers/debts-controller';

const router = express.Router();

router.get('/', verifySession(), ctrl.getAllDebts);
router.get('/:id', verifySession(), ctrl.getOneDebt);
router.post('/new', verifySession(), ctrl.createDebt);
router.put('/update/:id', verifySession(), ctrl.updateDebt);
router.delete('/delete/:id', verifySession(), ctrl.deleteDebt);

export default router;
