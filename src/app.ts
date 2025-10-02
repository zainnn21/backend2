import express from "express";
import courseRouter from "./routes/course";
import { logRequest } from "./middleware/logs";

const app = express();

app.use(logRequest);
app.use("/course", courseRouter);

app.listen(3000, () => {
  console.log("server is running on port 3000");
});
