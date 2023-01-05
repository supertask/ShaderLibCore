using UnityEngine;

namespace ShaderLibCore
{
    public enum SpringVectorType
    {
        Random = 0,
        Up,
        Down,
        Forward,
        Back
    }

    public class Spring : MonoBehaviour
    {
        private Camera m_MainCamera;
        private Material m_Material;

        private int m_RandomVector;
        private int m_ImpactValueAtCurveHash;

        private float m_TimeSincePressed;

        public AnimationCurve m_AnimationCurve;
        //public GameObject brownianPoint;
        
        private SpringVectorType springVectorType = SpringVectorType.Up;
        private float speed = 4.0f;


        // Start is called before the first frame update
        void Start()
        {
            m_MainCamera = Camera.main;
            m_Material = GetComponent<Renderer>().sharedMaterial;
            m_RandomVector = Shader.PropertyToID("_RandomVector");
            m_ImpactValueAtCurveHash = Shader.PropertyToID("_ImpactValueAtCurve");
            m_Material.SetVector(m_RandomVector, Vector3.up);
            m_Material.SetFloat(m_ImpactValueAtCurveHash, 0f);
        }

        // Update is called once per frame
        void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                OnButtonPressed();
            }
            //m_Material.SetVector("_HitPositionWS", brownianPoint.transform.position);
            //Debug.Log("brownianPoint: " +  brownianPoint.transform.position);

            if (m_TimeSincePressed < 1.0f) {
                m_Material.SetFloat(m_ImpactValueAtCurveHash, m_AnimationCurve.Evaluate(m_TimeSincePressed));
                m_TimeSincePressed += speed * Time.deltaTime;
            }
        }
        
        public void OnButtonPressed()
        {
            m_TimeSincePressed = 0.0f;
            if (springVectorType == SpringVectorType.Random) {
                m_Material.SetVector(m_RandomVector, Random.insideUnitSphere);
            } else {
                m_Material.SetVector(m_RandomVector, Vector3.up);
            }
        }
    }
}