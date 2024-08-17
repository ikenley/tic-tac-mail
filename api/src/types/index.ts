export type CreatePunParams = {
  prompt: string;
};

export type CreatePunResponse = {
  content: string;
};

export const CognitoExpressToken = "CognitoExpress";

export type RequestImageParams = {
  prompt: string;
};

export type CreateStoryParams = {
  title: string;
  description: string;
};
