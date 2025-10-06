import type { Response, Request } from "express";

export const getAllCourses = (req: Request, res: Response) => {
  res.json({
    message: "get all courses",
  });
};

export const getCourseById = (req: Request, res: Response) => {
  res.json({
    message: "get course by id",
  });
};

export const createNewCourse = (req: Request, res: Response) => {};

export const updateCourseById = (req: Request, res: Response) => {};

export const deleteCourseById = (req: Request, res: Response) =>{};
