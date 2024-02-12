# Spliit

[<img alt="Spliit logo" height="60" src="https://github.com/spliit-app/spliit/blob/main/public/logo-with-text.png?raw=true" />](https://spliit.app)

_**Disclaimer: This is my personal fork of Spliit that uses SQLite instead of
Postgres as the db solution.**_

Spliit is a free and open source alternative to Splitwise. You can either use
the official instance at [Spliit.app](https://spliit.app), or deploy your own
instance:

## Contribute

Please don't contribute here unless you want to help with SQLite stuff!
Contribute to the parent repo (<https://github.com/spliit-app/spliit>).

Consider supporting Sebastien, the original developer

- 💜 [Sponsor them on GitHub](https://github.com/sponsors/scastiel), or
- 💙
  [Make a small one-time donation](https://donate.stripe.com/28o3eh96G7hH8k89Ba).

## Run locally

1. Clone the repository (or fork it if you intend to contribute).
2. Run `npm install` to install dependencies. This will also apply database
   migrations and update Prisma Client.
3. Run `npm run dev` to start the development server.

## Run in a container

1. Run `npm run build-image` to build the docker image from the Dockerfile
2. Copy the file `container.env.example` as `container.env`
3. Run `npm run start-container` to start the postgres and the spliit2
   containers
4. You can access the app by browsing to `http://localhost:3000`.

## Opt-in features

### Expense documents

Spliit offers users to upload images (to an AWS S3 bucket) and attach them to
expenses. To enable this feature:

- Follow the instructions in the _S3 bucket_ and _IAM user_ sections of
  [next-s3-upload](https://next-s3-upload.codingvalue.com/setup#s3-bucket) to
  create and set up an S3 bucket where images will be stored.
- Update your environments variables with appropriate values:

```.env
NEXT_PUBLIC_ENABLE_EXPENSE_DOCUMENTS=true
S3_UPLOAD_KEY=AAAAAAAAAAAAAAAAAAAA
S3_UPLOAD_SECRET=AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
S3_UPLOAD_BUCKET=name-of-s3-bucket
S3_UPLOAD_REGION=us-east-1
```

You can also use other S3 providers by providing a custom endpoint:

```.env
S3_UPLOAD_ENDPOINT=http://localhost:9000
```

### Deduce category from title

You can offer users to automatically deduce the expense category from the title.
Since this feature relies on a OpenAI subscription, follow the signup
instructions above and configure the following environment variables:

```.env
NEXT_PUBLIC_ENABLE_CATEGORY_EXTRACT=true
OPENAI_API_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## License

MIT, see [LICENSE](./LICENSE).
