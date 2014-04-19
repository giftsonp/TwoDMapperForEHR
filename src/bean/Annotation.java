package bean;

public class Annotation {
		
		private int AnnotationID;
		private float x_Coord;
		private float y_Coord;
		private String dateOfDiag;
		private int doctorId;
		private String diseaseCode;
		private String diseaseDesc;
		private int BID;
		private String extraDiseaseName;
	
		private String level;
		private String display;
		
		private String status;
		
		
		
		private int skinCount;
		private int organCount;
		private int skeletonCount;
		

	
		public int getSkinCount() {
			return skinCount;
		}
		public void setSkinCount(int skinCount) {
			this.skinCount = skinCount;
		}
		public int getOrganCount() {
			return organCount;
		}
		public void setOrganCount(int organCount) {
			this.organCount = organCount;
		}
		public int getSkeletonCount() {
			return skeletonCount;
		}
		public void setSkeletonCount(int skeletonCount) {
			this.skeletonCount = skeletonCount;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getLevel() {
			return level;
		}
		public void setLevel(String level) {
			this.level = level;
		}
		public String getDisplay() {
			return display;
		}
		public void setDisplay(String display) {
			this.display = display;
		}
		public int getAnnotationID() {
			return AnnotationID;
		}
		public void setAnnotationID(int annotationID) {
			AnnotationID = annotationID;
		}
		public float getX_Coord() {
			return x_Coord;
		}
		public void setX_Coord(float x_Coord) {
			this.x_Coord = x_Coord;
		}
		public float getY_Coord() {
			return y_Coord;
		}
		public void setY_Coord(float y_Coord) {
			this.y_Coord = y_Coord;
		}
		public String getDateOfDiag() {
			return dateOfDiag;
		}
		public void setDateOfDiag(String dateOfDiag) {
			this.dateOfDiag = dateOfDiag;
		}
		public int getDoctorId() {
			return doctorId;
		}
		public void setDoctorId(int doctorId) {
			this.doctorId = doctorId;
		}
		public String getDiseaseCode() {
			return diseaseCode;
		}
		public void setDiseaseCode(String diseaseCode) {
			this.diseaseCode = diseaseCode;
		}
		public String getDiseaseDesc() {
			return diseaseDesc;
		}
		public void setDiseaseDesc(String diseaseDesc) {
			this.diseaseDesc = diseaseDesc;
		}
		public int getBID() {
			return BID;
		}
		public void setBID(int BID) {
			this.BID = BID;
		}
		public String getExtraDiseaseName() {
			return extraDiseaseName;
		}
		public void setExtraDiseaseName(String extraDiseaseName) {
			this.extraDiseaseName = extraDiseaseName;
		}
		
		
		
}