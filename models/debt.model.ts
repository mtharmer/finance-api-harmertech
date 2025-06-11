const mongoose = require("mongoose");

const debtSchema = new mongoose.Schema({
  userId: { type: String, required: true },
  name: { type: String, required: true },
  originalBalance: { type: Number, required: true },
  currentBalance: { type: Number },
  apr: { type: Number },
  originalTerm: { type: Number },
  minimumPayment: { type: Number, required: true },
});

const Debt = mongoose.model('Debt', debtSchema);
export default Debt;
