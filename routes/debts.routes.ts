import express from 'express';
import validateSession from '../middleware/validateSession';
import * as ctrl from '../controllers/debts.controller';

const router = express.Router();

router.get('/', validateSession(), ctrl.getAllDebts);
router.get('/:id', validateSession(), ctrl.getOneDebt);
router.post('/new', validateSession(), ctrl.createDebt);
router.put('/update/:id', validateSession(), ctrl.updateDebt);
router.delete('/delete/:id', validateSession(), ctrl.deleteDebt);

export default router;
