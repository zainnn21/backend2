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

export const getCourseById = async(req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const result = await courseModels.getCourseById(id);
    console.log(result);
    res.json({
      message: "get course by id",
      data: result,
    });
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ message: "Failed retrieving data", serverError: error });
  }
};

export const createNewCourse = async (req: Request, res: Response) => {
  try {
    const body: CourseDTO = req.body;
    await courseModels.createCourse(body);
    res.json({
      message: "create new course",
      data: body,
    });
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ message: "Failed create new data", serverError: error });
  }
};

export const updateCourseById = async (req: Request, res: Response) => {
  try {
    const body: CourseDTO = req.body;
    const id = Number(req.params.id);
    await courseModels.updateCourseById(body, id);
    res.json({
      message: "update course Success",
      data: body,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Failed update data", serverError: error });
  }
};

export const deleteCourseById = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    await courseModels.deleteCourseById(id);
    res.json({
      message: "delete Course Success",
      data: null,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Failed delete data", serverError: error });
  }
};
