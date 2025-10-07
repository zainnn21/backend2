import type { CourseDTO } from "../dto/courseDTO";
import * as courseModels from "../models/courses";
import type { Response, Request } from "express";

export const getAllCourses = async (req: Request, res: Response) => {
  try {
    const result = await courseModels.getAllCourses();
    res
      .status(200)
      .json({ message: "Successfully retrieving data", data: result.rows });
  } catch (err) {
    console.log(err);
    res
      .status(500)
      .json({ message: "Failed retrieving data", serverError: err });
  }
};

export const getCourseById = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const result = await courseModels.getCourseById(id);
    console.log(result);
    res.status(200).json({
      message: "get course by id",
      data: result.rows,
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
    if (!body) {
      res.status(400).json({
        message: "body is empty",
      });
    }
    await courseModels.createCourse(body);
    res.status(201).json({
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
    res.status(201).json({
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
    res.status(200).json({
      message: "delete Course Success",
      data: null,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Failed delete data", serverError: error });
  }
};
