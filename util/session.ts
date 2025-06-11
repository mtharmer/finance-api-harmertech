import { SessionRequest } from 'supertokens-node/framework/express';

export function userIdFromReq(req: SessionRequest) {
  return req.session!.getUserId();
}
