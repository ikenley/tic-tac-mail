# Docker image for Lambda entrypoint
# https://docs.aws.amazon.com/lambda/latest/dg/nodejs-image.html

FROM public.ecr.aws/lambda/nodejs:20 as builder

WORKDIR /usr/app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Bundle app source code
COPY . ./
RUN npm run build 

# Minimal lambda runtime
FROM public.ecr.aws/lambda/nodejs:20 as runtime 

WORKDIR ${LAMBDA_TASK_ROOT}

# Install runtime dependencies
COPY --from=builder /usr/app/package*.json ./
RUN npm ci && npm prune --omit=dev

COPY --from=builder /usr/app/dist ./dist

ARG APP_VERSION
ENV APP_VERSION=$APP_VERSION
CMD ["dist/index-api-lambda.handler"]