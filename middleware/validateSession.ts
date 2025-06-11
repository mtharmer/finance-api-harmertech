import { verifySession } from "supertokens-node/recipe/session/framework/express";

export default function validateSession() {
  return verifySession();
}
