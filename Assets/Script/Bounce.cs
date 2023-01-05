using UnityEngine;

namespace ShaderLibCore
{
    public class Bounce : MonoBehaviour
    {
        private Camera m_MainCamera;
        private Material m_Material;

        private int m_RaycastHitHash;
        private int m_ImpactValueAtCurveHash;
        private int m_NormalDir;

        private float m_TimeSincePressed;

        public AnimationCurve m_AnimationCurve;
        //public GameObject brownianPoint;


        // Start is called before the first frame update
        void Start()
        {
            m_MainCamera = Camera.main;
            m_Material = GetComponent<Renderer>().sharedMaterial;
            m_RaycastHitHash = Shader.PropertyToID("_HitPositionWS");
            m_ImpactValueAtCurveHash = Shader.PropertyToID("_ImpactValueAtCurve");
            m_NormalDir = Shader.PropertyToID("_NormalDir");
            m_Material.SetVector(m_RaycastHitHash, Vector3.up);
            m_Material.SetFloat(m_ImpactValueAtCurveHash, 0f);
        }

        // Update is called once per frame
        void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                Ray ray = m_MainCamera.ScreenPointToRay(Input.mousePosition);
                RaycastHit raycastHit;

                //Debug.Log("mousePosition: " + Input.mousePosition);
                if (Physics.Raycast(ray, out raycastHit))
                {
                    m_TimeSincePressed = 0;
                    //Debug.Log("raycastHit: " + raycastHit.point);
                    //m_Material.SetFloat("_Seed", Time.time);
                    m_Material.SetVector(m_NormalDir, Random.insideUnitSphere);
                    m_Material.SetVector(m_RaycastHitHash, raycastHit.point);
                }
            }
            //m_Material.SetVector("_HitPositionWS", brownianPoint.transform.position);
            //Debug.Log("brownianPoint: " +  brownianPoint.transform.position);

            if (m_TimeSincePressed < 1.0f) {
                m_TimeSincePressed += Time.deltaTime;
                m_Material.SetFloat(m_ImpactValueAtCurveHash, m_AnimationCurve.Evaluate(m_TimeSincePressed));
            }
        }
    }
}