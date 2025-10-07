import type { CourseDTO } from "../dto/courseDTO";
import * as courseModels from "../models/courses";
import type { Response, Request } from "express";

export const getAllCourses = async (req: Request, res: Response) => {
  try {
    const result = await courseModels.getAllCourses();
    res.json({ message: "Successfully retrieving data", data: result.rows });
  } catch (err) {
    console.log(err);
    res
      .status(500)
      .json({ message: "Failed retrieving data", serverError: err });
  }
};

export const getCourseById = (req: Request, res: Response) => {
  res.json({
    message: "get course by id",
  });
};

export const createNewCourse = async (req: Request, res: Response) => {
  try {
    const body: CourseDTO = req.body;
    console.log("request body: ", body);
    await courseModels.createCourse(body);
    res.json({
      message: "create new course",
      data: body,
    });
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ message: "Failed retrieving data", serverError: error });
  }
};

export const updateCourseById = (req: Request, res: Response) => {};

export const deleteCourseById = (req: Request, res: Response) => {};
