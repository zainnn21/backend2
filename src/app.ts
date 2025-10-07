import express from "express";
import courseRouter from "./routes/course";
import { logRequest } from "./middleware/logs";

const app = express();
const PORT = process.env.PORT || 4000;

// middleware untuk parsing JSON body
app.use(express.json());

app.use(logRequest);
app.use("/course", courseRouter);

app.listen(PORT, () => {
  console.log(`server is running on port ${PORT}`);
});
