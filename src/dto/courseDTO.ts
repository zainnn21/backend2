export interface CourseDTO {
  courseId: number;
  courseName: string;
  tutorName: string;
  description: string;
  userId: number;
  rating: number;
  reviewCount: number;
  price: number;
  Duration: number;
  certificate: boolean;
  createdAt: Date;
  updatedAt: Date;
}
